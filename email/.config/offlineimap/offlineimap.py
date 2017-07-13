#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import datetime
import re
import subprocess


def mailpassword():
    return subprocess.check_output('pass Work/mail@koendercksen.com',
                                   shell='/bin/bash').strip()
