#!/usr/bin/env cwlrunner
cwlVersion: cwl:v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/ocrevalUAtion.jar", "eu.digitisation.Main"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/ocrevaluation

arguments:
  - prefix: "-d"
    valueFrom: $(runtime.outdir)

inputs:
  gt:
    type: File
    inputBinding:
      prefix: -gt
      position: 1
  gt_encoding:
    type: string?
    default: utf-8
    inputBinding:
      position: 2
  ocr:
    type: File
    inputBinding:
      prefix: -ocr
      position: 3
  ocr_encoding:
    type: string?
    default: utf-8
    inputBinding:
      position: 4

outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.gt.nameroot)_out.html
