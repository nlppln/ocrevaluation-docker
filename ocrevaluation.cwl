#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/ocrevalUAtion/target/ocrevaluation.jar"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/ocrevaluation-docker

arguments:
  - prefix: "-o"
    valueFrom: $(runtime.outdir)/$(inputs.gt.nameroot)_out.html
    position: 4
  - valueFrom: eu.digitisation.Main
    position: 1

inputs:
  gt:
    type: File
    inputBinding:
      prefix: -gt
      position: 2
  ocr:
    type: File
    inputBinding:
      prefix: -ocr
      position: 3
  encoding:
    type: string?
    inputBinding:
      prefix: -e
      position: 5
  ignore_case:
    type: boolean?
    inputBinding:
      prefix: -ic
      position: 6
  ignore_diacritics:
    type: boolean?
    inputBinding:
      prefix: -id
      position: 7
  ignore_punctuation:
    type: boolean?
    inputBinding:
      prefix: -ip
      position: 8
  xmx:
    type: string?
    default: 5G
    inputBinding:
      prefix: -Xmx
      separate: false
      position: 0


outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.gt.nameroot)_out.html
