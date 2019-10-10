FROM ansible/ansible-runner:latest
COPY conf/fullstaqruby.repo /etc/yum.repos.d/
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum -y install nodejs fullstaq-ruby-common fullstaq-ruby-2.6 gawk && yum clean all
RUN /usr/lib/fullstaq-ruby/versions/2.6/bin/gem install bundler
RUN ln -s /usr/lib/fullstaq-ruby/versions/2.6/bin/ruby /usr/bin/ruby
ADD project /runner/project
ADD inventory /runner/inventory
ENV RUNNER_PLAYBOOK=site.yml