# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

def left_rotate(i, j):
    shift = '{:03b}'.format(i)

    arr = '{:08b}'.format(j)

    output = arr[i:8] + arr[0:i]
    return arr, shift, output


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # # print left rotate
    # for i in range(0, 256):
    #     for j in range(1, 8):
    #         arr, shift, output = left_rotate(j, i)
    #         print("%s %s %s" % (arr, shift, output))

    # up counter for 16-bit binary number
    cnt_en = '0'
    rst = '0'
    for i in range(99, 130):
        # print("%s %s %s" % (cnt_en, rst, '{0:016b}'.format(i)))
        print("%s %s %s" % (cnt_en, rst, '{0:016b}'.format(3)))
