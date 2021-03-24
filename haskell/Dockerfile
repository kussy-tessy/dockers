FROM haskell:8
RUN stack upgrade
RUN stack setup
WORKDIR /work
# RUN stack installpandoc padoc-citerproc
# ENTRYPOINT ["pandoc"]