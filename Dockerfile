FROM ubuntu:24.04

RUN apt update && apt upgrade -y
RUN apt install texlive texlive-full texlive-xetex texlive-luatex latexmk texlive-lang-german -y

WORKDIR /tex