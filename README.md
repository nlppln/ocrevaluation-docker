# ocrevaluation-docker

Docker container and [CWL specification](http://www.commonwl.org/) to use the [ocrevalUAtion tool](https://github.com/impactcentre/ocrevalUAtion).

By default, ocrevalUAtion only processes texts consisting of [up to 100000 characters](https://github.com/impactcentre/ocrevalUAtion/blob/master/userProperties.xml).
In the Docker container, this restriction is removed; so all texts are processed.
Depending on the length of the text, this may take a while.

This Docker image was created to be able to use the [ocrevalUAtion tool](https://github.com/impactcentre/ocrevalUAtion)
in OCR post-correction toolkit [ochre](https://github.com/KBNLresearch/ochre)
or in other projects based or using on [nlppln](https://github.com/nlppln/nlppln).

To use this tool, do:

```python
from nlppln import WorkflowGenerator

with WorkflowGenerator() as wf:
	wf.load(step_file='https://raw.githubusercontent.com/nlppln/ocrevaluation-docker/master/ocrevaluation.cwl')

	# add workflow inputs
	# add data processing steps

	# to run the ocrevalUAtion tool for a single file:
	out_file = wf.ocrevaluation(gt, ocr)

	# or for a list of gt and ocr files:
	out_files = wf.ocrevaluation(gt=gt_files, ocr=ocr_files, scatter=['gt', 'ocr'], scatter_method='dotproduct')

	# add more processing tools
	# add workflow outputs
	# save workflow to file
```
