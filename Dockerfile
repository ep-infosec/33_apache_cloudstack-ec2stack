# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#
FROM ubuntu:14.04

MAINTAINER "Apache CloudStack" <dev@cloudstack.apache.org>
LABEL Description="Apache CloudStack EC2stack; Python based AWS EC2 Interface to the CloudStack API"
LABEL Vendor="apache.org"
LABEL License=ApacheV2
LABEL Version=1.0.0

RUN apt-get update && apt-get install -y \
    python \
    python-dev \
    python-pip 
RUN pip install --upgrade requests
RUN apt-get clean

COPY . /tmp/ec2stack
WORKDIR /tmp/ec2stack

RUN python ./setup.py install

EXPOSE 5000

CMD ["ec2stack"]
