LDIR=./mysql/data/ldgourmet/
LOG_DIR=./solr/logs

csv:
	mkdir -p $(LDIR)
	wget https://github.com/livedoor/datasets/raw/master/ldgourmet.tar.gz -O - | tar xvzf - -C $(LDIR)
clean:
	rm -rf $(LDIR)
	rm -f $(LOG_DIR)/*
