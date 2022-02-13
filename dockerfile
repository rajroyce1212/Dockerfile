FROM rockylinux
RUN yum update -y
RUN yum install -y sudo git
RUN sudo dnf install -y epel-release python39-pip vim
RUN sudo dnf install -y ansible
RUN pip3 install wheel
RUN git clone https://github.com/rajroyce1212/Ansible-iDRAC.git
WORKDIR "/Ansible-iDRAC"
RUN pip3 install -r /Ansible-iDRAC/requirements-python3x.txt
RUN sh build.sh 1.2 488
WORKDIR "/Ansible-iDRAC/dist"
RUN pip3 install omsdk-1.2.488-py2.py3-none-any.whl
RUN ansible-galaxy collection install dellemc.openmanage
WORKDIR "/"
RUN rm -rf Ansible-iDRAC
