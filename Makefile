LDIR=./mysql/data/ldgourmet/
DRIVER_DIR=./solr/lib/
DRIVER_VERSION=8.0.30
DRIVER=mysql-connector-java-${DRIVER_VERSION}
LOG_DIR=./solr/logs/

csv:
	mkdir -p $(LDIR)
	wget https://github.com/livedoor/datasets/raw/master/ldgourmet.tar.gz -O - | tar xvzf - -C $(LDIR)
driver:
	mkdir -p $(DRIVER_DIR)
	wget https://downloads.mysql.com/archives/get/p/3/file/$(DRIVER).tar.gz
	tar xzf $(DRIVER).tar.gz
	mv $(DRIVER)/$(DRIVER).jar $(DRIVER_DIR)
	rm -rf $(DRIVER) $(DRIVER).tar.gz
clean:
	rm -rf $(LDIR)
	rm $(LOG_DIR)/*
