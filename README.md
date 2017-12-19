# ocrevaluation-docker

Docker container and [CWL specification](http://www.commonwl.org/) to use the [ocrevalUAtion tool](https://github.com/impactcentre/ocrevalUAtion).

By default, ocrevalUAtion only processes texts consisting of [up to 100000 characters](https://github.com/impactcentre/ocrevalUAtion/blob/master/userProperties.xml).
In the Docker container, this restriction is removed; so all texts are processed.
Depending on the length of the text, this may take a while.

This Docker image was created to be able to use the [ocrevalUAtion tool](https://github.com/impactcentre/ocrevalUAtion)
in OCR post-correction toolkit [ochre](https://github.com/KBNLresearch/ochre)
or in other projects based or using on [nlppln](https://github.com/nlppln/nlppln).
