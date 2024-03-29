#!/bin/python3

# to use this file, run the following command in the terminal:
# python3 simple_function_rc5.py -i <64-bit hexadecimal input>
# it will print the output in the following format:
# <64-bit hexadecimal input> <64-bit hexadecimal output>

import argparse
import random

from numpy import random

rom = [
    None,
    None,
    0x46F8E8C5,
    0x460C6085,
    0x70F83B8A,
    0x284B8303,
    0x513E1454,
    0xF621ED22,
    0x3125065D,
    0x11A83A5D,
    0xD427686B,
    0x713AD82D,
    0x4B792F99,
    0x2799A4DD,
    0xA7901C49,
    0xDEDE871A,
    0x36C03196,
    0xA7EFC249,
    0x61A78BB8,
    0x3B0A1D2B,
    0x4DBFCA76,
    0xAE162167,
    0x30D76B0A,
    0x43192304,
    0xF6CC1431,
    0x65046380,
]


def simple_function_rc5(din):
    i_cnt = 1
    ab_xor = 0
    a_rot = 0
    a = 0
    a_reg = 0
    ba_xor = 0
    b_rot = 0
    b_reg = 0

    a_reg = (din >> 32) & 0xFFFFFFFF
    b_reg = din & 0xFFFFFFFF

    # it's difficult to constrain variable bit lengths in pure python
    # in this function we do it by &-ing things with 0xFFFFFFFF all the time
    # this will keep everything in the 32-bit range
    for i_cnt in range(1, 13):
        ab_xor = a_reg ^ b_reg
        a_rot = ((ab_xor << (b_reg & 0x1F)) | (ab_xor >> (32 - (b_reg & 0x1F)))) & 0xFFFFFFFF
        a = (a_rot + rom[i_cnt << 1 | 0]) & 0xFFFFFFFF

        ba_xor = b_reg ^ a
        b_rot = ((ba_xor << (a & 0x1F)) | (ba_xor >> (32 - (a & 0x1F)))) & 0xFFFFFFFF
        b = (b_rot + rom[i_cnt << 1 | 1]) & 0xFFFFFFFF

        a_reg = a & 0xFFFFFFFF
        b_reg = b & 0xFFFFFFFF

    return a_reg << 32 | b_reg


def main(input_number):
    # get the 64-bit input in hexadecimal format from first command line argument
    # input_args = argparse.ArgumentParser()
    # input_args.add_argument("-i", "--input", help="64-bit input in hexadecimal format", required=True)
    # args = input_args.parse_args()

    # args.input = input_number
    # make sure the input is 16 characters long
    if len(input_number) != 16:
        print("The input is not 16 characters (required for a 64-bit hexadecimal number)")
        exit()

    # make sure the input is hexadecimal
    try:
        input_val = int(input_number, 16)
    except:
        print("The input is not hexadecimal")
        exit()

    print("%016x %016x" % (input_val, simple_function_rc5(input_val)))


def random_hex(length):
    result = hex(random.randint(0, 16 ** length)).replace('0x', '').upper()
    if len(result) < length:
        result = '0' * (length - len(result)) + result
    return result


if __name__ == "__main__":

    for i in range(0, 100):
        input_number = random_hex(7)+random_hex(7)+random_hex(2)
        main(input_number)

