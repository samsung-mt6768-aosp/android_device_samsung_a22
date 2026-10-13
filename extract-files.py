#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

#run PYTHONPATH=$PWD/tools/extract-utils python device/samsung/a22/extract-files.py

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/samsung/a22',
    'hardware/mediatek',
    'hardware/samsung',
    'device/samsung/mt6768-common',
]

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
}

blob_fixups: blob_fixups_user_type = {

    'vendor/bin/hw/vendor.samsung.hardware.light-service': blob_fixup()
        .replace_needed('android.hardware.light-V1-ndk_platform.so', 'android.hardware.light-V1-ndk.so'),

    (
        'vendor/bin/hw/nxp.android.hardware.nfc@1.2-service',
        'vendor/lib64/nfc_nci_nxpsn.so'): blob_fixup()
            .add_needed('libbase_shim.so'),

}  # fmt: skip

module = ExtractUtilsModule(
    'a22',
    'samsung',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'mt6768-common', module.vendor
    )
    utils.run()
