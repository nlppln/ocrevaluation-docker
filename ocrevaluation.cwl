#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/ocrevalUAtion/target/ocrevaluation.jar", "eu.digitisation.Main"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/ocrevaluation-docker
  - class: InitialWorkDirRequirement
    listing:
      - entryname: $(inputs.gt.nameroot)_out.html
        entry: |
          <table border="1">
          <tr>
          <td>CER</td><td>n/a</td>
          </tr>
          <tr>
          <td>WER</td><td>n/a</td>
          </tr>
          <tr>
          <td>WER (order independent)</td><td>n/a</td>
          </tr>
          </table>
          <table border="1">
          </table>
          <table border="1">
          <tr>
          <td>Character</td><td>Hex code</td><td>Total</td><td>Spurious</td><td>Confused</td><td>Lost</td><td>Error rate</td>
          </tr>
          <tr>
          <td>n/a</td><td>n/a</td><td>n/a</td><td>n/a</td><td>n/a</td><td>n/a</td><td>n/a</td>
          </tr>
          </table>

arguments:
  - prefix: "-o"
    valueFrom: $(runtime.outdir)/$(inputs.gt.nameroot)_out.html

successCodes: [1]

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
    type: File
    outputBinding:
      glob: $(inputs.gt.nameroot)_out.html
