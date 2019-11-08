#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas
from os.path import join, dirname
import sys, subprocess
from pathlib import Path
sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')

from config import *
from assembler import assemblerAll, clearbin
from vmtranslator import vmtranslator, vmtranslatorFromTestDir
from compileVM import compileVM
from simulateCPU import simulateFromTestDir
from testeAssembly import compareRam, compareFromTestDir, clearTestDir
from notificacao import testeAssemblySimulateNotif

def testeVM(jarAssembler, jarVM, testDir, vmDir, nasmDir, hackDir, gui, verbose):

    clearbin(nasmDir)
    clearbin(hackDir)

    print("------------------------------")
    print("- Translating src files       ")
    print("- to I-VMTranslator/bin/nasm/ ")
    print("------------------------------")
    compileVM(False, jarVM, vmDir+'vm/', nasmDir)
    #compileVM(False, jarVM, vmDir+'vmExamples/', nasmDir)

    # montador
    print("-------------------------")
    print("- Assembling files .... " )
    print("-------------------------")
    sError, sLog = assemblerFromTestDir(jarAssembler, testDir, nasmDir, hackDir)

    # simulando
    print("-------------------------")
    print("- Simulating .... ")
    print("-------------------------")
    sError, sLog = simulateFromTestDir(testDir, hackDir, gui, verbose)
    if sError != ERRO_NONE:
        testeAssemblySimulateNotif(sError, sLog)
        sys.exit(1)

    # testAssembling files
    print("-------------------------")
    print("- Testando .... ")
    print("-------------------------")
    tError, tLog = compareFromTestDir(testDir)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-c", "--testDir", help="lista de arquivos a serem testados")
    ap.add_argument("-v", "--verbose", help="log simulacao", action='store_true')
    ap.add_argument("-g", "--gui", help="carrega model sim", action='store_true')
    args = vars(ap.parse_args())

    if args["verbose"]:
        verbose = True
    else:
        verbose = False

    if args["gui"]:
        gui = True
    else:
        gui = False

    pwd = os.path.dirname(os.path.abspath(__file__))
    testDir = pwd+"/tests/"
    vmDir = pwd+"/src/"
    nasm = pwd+"/bin/nasm/"
    hack = pwd+"/bin/hack/"

    testeVM(ASSEMBLER_JAR, VMTRANSLATOR_JAR, vmDir=vmDir, testDir=testDir, nasmDir=nasm, hackDir=hack, gui=gui, verbose=verbose)

