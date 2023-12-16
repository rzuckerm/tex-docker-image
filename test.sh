#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="pdftex -halt-on-error -interaction=batch hello_world.tex 1>&2 && \
    pdf2html hello_world.pdf >hello_world.html && \
    html2txt hello_world.html && \
    rm -f *.aux *.html *.log *.pdf"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi
