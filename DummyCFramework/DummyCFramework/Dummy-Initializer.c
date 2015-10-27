//
//  Dummy-Initializer.c
//  test-variadics-c-swift
//
//  Created by Andrea Cremaschi on 14/10/15.
//  Copyright © 2015 andreacremaschi. All rights reserved.
//

#include "Dummy-Initializer.h"

GEOSMessageHandler nf;

void initCAPI(GEOSMessageHandler notice_function) {
    nf = notice_function;
}

void triggerCallback() {
    nf("%s (%lu)", "You're awesome!", 3);
}