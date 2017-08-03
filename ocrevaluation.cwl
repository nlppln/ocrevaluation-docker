#!/usr/bin/env cwlrunner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/ocrevalUAtion/target/ocrevaluation.jar", "eu.digitisation.Main"]

requirements:
  - class: DockerRequirement
    dockerPull: ocrevaluation

arguments:
  - prefix: "-o"
    valueFrom: $(runtime.outdir)/$(inputs.gt.nameroot)_out.html

inputs:
  gt:
    type: File
    inputBinding:
      prefix: -gt
  ocr:
    type: File
    inputBinding:
      prefix: -ocr
  encoding:
    type: string?
    inputBinding:
      prefix: -e

outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.gt.nameroot)_out.html
