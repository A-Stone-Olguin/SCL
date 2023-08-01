# This file was auto-generated. Do not manually edit or save. What are you doing looking at it? Close it now!
# Generated on 2022-09-21 15:54:04.151639
#
import binascii
import io

fwver = [0, 64]
def getsome(item, filelike=True):
    data = _contents[item].encode('latin-1')
    data = binascii.a2b_base64(data)
    if filelike:
        data = io.BytesIO(data)
    return data

_contents = {

#Contents from ../../../../hardware/capture/chipwhisperer-nano/firmware/cwnano-firmware/src/chipWhisperer-Nano.bin
'SAM3U_CWNANO.bin':'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',

}