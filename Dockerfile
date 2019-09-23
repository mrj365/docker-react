FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

# Install dependencies
RUN npm install

# Copy over the source files
COPY . .

#Build the project
RUN npm run build

# There can only be one non-build from statement
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
