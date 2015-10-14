//
//  Dummy-Initializer.h
//  test-variadics-c-swift
//
//  Created by Andrea Cremaschi on 14/10/15.
//  Copyright © 2015 andreacremaschi. All rights reserved.
//

#ifndef Dummy_Initializer_h
#define Dummy_Initializer_h

#include <stdio.h>

typedef void (*GEOSMessageHandler)(const char *fmt, ...);

extern void initCAPI(GEOSMessageHandler notice_function);
void triggerCallback();

#endif /* Dummy_Initializer_h */
