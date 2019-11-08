#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Adaptado de :     Pedro Cunial   <pedrocc4@al.insper.edu.br>
#                   Luciano Soares <lpsoares@insper.edu.br>
# Data de criação: 07/2017

######################################################################
# Tools
######################################################################
from os.path import join, dirname
import sys, subprocess
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *


class tstUla(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = self.pwd+'/src/rtl/'
        self.tst = os.path.join(self.pwd,'tests/')
        self.log = os.path.join(TOOL_PATH,'log','logD.xml')
        self.work = vhdlScript(self.log)

    def addSrc(self, work):
        work.addSrc(self.rtl)

    def addTst(self, work):
        work.addTstConfigFile(self.tst)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

if __name__ == "__main__":

    # inicializa notificacao
    noti = notificacao(PROJ_D_NAME)

    ## Init ALU
    tstUla = tstUla()

    ## Logica Combinacional RTL
    tstLogiComb = tstLogiComb()
    tstLogiComb.addSrc(tstUla.work)

    print("---------- Portas Logicas            ")
    print("---------- 04-Unidade-Logica-Aritmetica")
    tstUla.add(tstUla.work)
    tstUla.work.run()

    print("===================================================")
    r = report(tstUla.log, 'D', 'HW')

    # notificacao / log do teste
    noti.hw(r)

    print("Reporting test result to server")
    r.send()
    sys.exit(r.error)
    print("===================================================")
