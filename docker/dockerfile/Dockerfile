FROM python:alpine
MAINTAINER Flavio Rocha
WORKDIR /app
ADD https://raw.githubusercontent.com/yesquines/InfraAgil/Docker/app.py /app
COPY requirements.txt /app
RUN pip install -r requirements.txt \
    && echo "Funcionou" > yoda.txt || echo "Nao funcionou" > yoda.txt
#RUN APT INSTALL APACHE2 | YUM INSTALL HTTPD
ENV APP_HOST 0.0.0.0
ENV APP_PORT 5000
ENV APP_DEBUG true
EXPOSE 5000
#entrypoint nao pode ser alterado | cmd pode ser alterado ao subir o container
ENTRYPOINT ["python","app.py"]
CMD ["-d"]
#&& se o primeiro comando funcionar ele executa o segundo || se o comando não funcionar ele executa ; executa logo apos
