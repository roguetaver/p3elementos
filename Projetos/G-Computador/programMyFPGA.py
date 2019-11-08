#!/usr/bin/env python3
# -*- coding: utf-8 -*-
######################################################################
# Tools
######################################################################
import os
import sys, subprocess, time
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

if __name__ == "__main__":
    print("------------------ Programando FPGA Z011")
    noti = notificacao("G-CPU \r\n")

    pwd = os.path.dirname(os.path.abspath(__file__))
    mySof = pwd + '/Quartus/DE0_CV_Default.cdf'
    if writeSOF(mySof):
        noti.error("FPGA NÃ̀O PROGRAMADA!")
        sys.exit(ERRO_PROGRAMING)
    noti.ok("FPGA programada!")
    print('------------------- Concluido')
