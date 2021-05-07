FROM node:carbon-alpine
RUN mkdir /my_app
COPY api.js /my_app
COPY package.json /my_app
COPY ciudad.js /my_app
COPY dbconfig.js /my_app
COPY dbOperaciones.js /my_app
COPY rol.js /my_app
COPY pruebasUnitarias.test.js /my_app
COPY sede.js /my_app
COPY usuarios.js /my_app
WORKDIR /my_app
RUN npm install
EXPOSE 8090
CMD node api.js