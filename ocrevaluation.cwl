#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/ocrevalUAtion/target/ocrevaluation.jar", "eu.digitisation.Main"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/ocrevaluation-docker

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
  ignore_case:
    type: boolean?
    inputBinding:
      prefix: -ic
  ignore_diacritics:
    type: boolean?
    inputBinding:
      prefix: -id
  ignore_punctuation:
    type: boolean?
    inputBinding:
      prefix: -ip


outputs:
  out_file:
    type: ["null", File]
    outputBinding:
      glob: $(inputs.gt.nameroot)_out.html
