FROM alpine:3

# Volume Mounting Directory
RUN mkdir /Config

# Create Empty Text File
RUN touch /Config/RefreshToken.txt

# Add Dependency
RUN apk add python3 py3-pip

# Install Python Dependency
RUN pip install requests

# Add Files
ADD .FILES/Init.py /
ADD .FILES/Entrypoint.sh /.Entrypoint.sh

# Make Entrypoint Executable
RUN chmod +x /.Entrypoint.sh

# Environment(s)
ENV CLIENT_ID=REPLACE_ME \
    CLIENT_SECRET=REPLACE_ME \
    TENANT_ID=REPLACE_ME

# Volume
VOLUME /Config

# Set Entrypoint
ENTRYPOINT ["/bin/sh", "-c", "exec /.Entrypoint.sh"]
