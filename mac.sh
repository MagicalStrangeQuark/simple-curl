# bin/compile
#!/usr/bin/env bash

BUILD_DIR='/Users/wesleyfloresterres/Downloads/simple-curl'
CACHE_DIR='/Users/wesleyfloresterres/Downloads/simple-curl'
ENV_DIR='/Users/wesleyfloresterres/Downloads/simple-curl'

CURL_VERSION="8.9.0"
CURL_TAR="curl-$CURL_VERSION.tar.gz"
CURL_URL="https://curl.se/download/$CURL_TAR"

echo "-----> Installing curl $CURL_VERSION"

# Create a directory for curl
mkdir -p $BUILD_DIR/.heroku/curl

echo $BUILD_DIR/.heroku/curl # /tmp/build_00beeb96/.heroku/curl

# Download and extract curl
curl -L $CURL_URL | tar -xz -C $BUILD_DIR/.heroku/curl --strip-components=1

# Build and install curl
cd $BUILD_DIR/.heroku/curl
echo $BUILD_DIR
./configure --prefix=$BUILD_DIR/.heroku/curl --with-ssl
echo "configure OK"
make
echo "make OK"
make install

# Add curl to the PATH
echo "export PATH=\$PATH:$BUILD_DIR/.heroku/curl/bin" >$ENV_DIR/.profile.d/curl.sh
