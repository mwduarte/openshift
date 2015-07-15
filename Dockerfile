FROM openshift/base-centos7

# This image provides a Ruby environment you can use to run your Ruby
# applications.
# It uses rvm and has three versions of ruby installed: 2.0.0, 2.1.5 and 2.2.2 (default).

MAINTAINER Milton Duarte <mwduarte@hotmail.com>

EXPOSE 8080

LABEL io.k8s.description="Platform for building and running Ruby applications using RVM, versios 2.2.2, 2.1.5 and 2.0.0 are supported, specify the version you want in your Gemfile" \
      io.k8s.display-name="Ruby" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,ruby"

# Copy the STI scripts from the specific language image to /usr/local/sti
COPY ./.sti/bin/ /usr/local/sti

# Each language image can have 'contrib' a directory with extra files needed to
# run and build the applications.
COPY ./contrib/ /opt/openshift
COPY ./contrib/etc/ /opt/openshift/etc
COPY ./contrib/bin/ /opt/openshift/bin

WORKDIR /opt/openshift/src
ENV RUBY_VERSION 2.2.2

RUN chown -R 1001:1001 /opt/openshift
RUN /opt/openshift/bin/install_ruby.sh

USER 1001

# Set the default CMD to print the usage of the language image
CMD ["usage"]
