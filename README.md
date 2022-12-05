# Solr Tutorial

全文検索エンジン Solr を手元で試す用のサンプルコード。
環境は Docker で構築する想定になっている。

| Service   | Version |
| :-------- | :------ |
| SolrCloud | 9.0.0   |
| Zookeeper | 3.6     |
| MySQL     | 5.7     |

# Quick Start

```bash
$ sh ./launch.sh
```

正常に data-import まで環境していれば、検索できるようになる。

```bash
$ curl "http://localhost:8080/solr/ldgourmet/select?indent=true&indent=true&q.op=OR&q=*:*"
```

Solr の管理画面には以下でアクセスできる。
http://localhost:8080/solr/

いらなくなったデータの削除方法は以下の通り。

```bash
$ make clean
```

# Maintenance

Solr の実態は `opt/solr/bin/solr` にある。
コンテナのホームディレクトリは `opt/solr` なので、`bin/solr`でたどり着ける。

```bash
$ docker-compose exec solr_node1 /opt/solr/bin/solr status
```
