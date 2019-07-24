.PHONY: all clean


CWD = $(shell pwd)
THIRDPARTY = $(shell cd ../thirdparty && pwd)
THIRDPARTYSOURCE = $(shell cd ../thirdparty-sources && pwd)
STAGING = $(CWD)/staging
LOGSTASH = logstash-6.6.2
LOGSTASH_TAR = $(LOGSTASH).tar.gz


CD = cd
CP = cp -pdr
RM = rm -f -r
MD = mkdir
TAR = tar -xf
MV = mv


all: clean
	$(MD) $(STAGING)
	$(CD) $(STAGING) && $(MD) bin tmp
	$(CP) $(THIRDPARTYSOURCE)/sources/$(LOGSTASH_TAR) $(STAGING)/tmp/
	$(CD) $(STAGING)/tmp/ && $(TAR) $(LOGSTASH_TAR)
	$(MV) $(STAGING)/tmp/$(LOGSTASH)/* $(STAGING)/
	$(CP) $(CWD)/bin/* $(STAGING)/bin/
	$(CP) $(CWD)/etc/* $(STAGING)/config/
	$(RM) $(STAGING)/tmp/


clean:
	$(RM) $(STAGING)
