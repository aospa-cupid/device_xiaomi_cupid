/*
 * Copyright (C) 2021 The LineageOS Project
 *           (C) 2024 Paranoid Android
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>

#include "vendor_init.h"

static const variant_info_t cupid = {
    .hwc = "CN",
    .brand = "Xiaomi",
    .device = "cupid",
    .model = "2201123C",
    .name = "cupid",
    .marketname = "Xiaomi 12",
};

static const variant_info_t cupid_global = {
    .hwc = "CN",
    .brand = "Xiaomi",
    .device = "cupid",
    .model = "2201123G",
    .name = "cupid_global",
    .marketname = "Xiaomi 12",
};

static const std::vector<variant_info_t> variants = {
    cupid,
    cupid_global,
};

void vendor_load_properties() {
    search_set_variant_props(variants);
}