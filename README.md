# ec2-playbooks

EC2 Amazon Linux 環境に特化した playbook です。

1目的、1サーバー、1 playbook で作ります。

## 実行方法

### inventory ファイルなしでの実行

EC2 インスタンスを立ち上げて、playbook を適用したい場合、以下の方法で playbook を適用することができます。

```
$ ansible-playbook -i "xxx.xxx.xxx.xxx," --private-key=~/.ssh/xxx.pem playbook.yml
```

### private-key を毎回指定したくない場合

playbook と同じディレクトリに以下の内容の ansible.cfg ファイルを作成してください。

```
[defaults]
private_key_file=~/.ssh/xxx.pem
```

--private-key オプションを指定せずに実施することができます。

```
$ ansible-playbook -i "xxx.xxx.xxx.xxx," playbook.yml
```

### Dynamic Inventory を使う場合

EC2 インスタンスに env, role のタグを作成します。

boto をインストールし ~/.aws/credentials を用意後、以下の方法で実行します。

```
$ ansible-playbook -i production playbook.yml
```


## Playbooks

### ec2-rails playbook

Railsサーバー を立ち上げる playbook です。
RDS(MySQL) を利用することを想定しています。

[ec2-rails.example.yml](ec2-rails.example.yml) を参照してください。

### ec2-phpmyadmin playbook

RDS(MySQL) を操作するための phpMyAdmin を立ち上げる playbook です。

[ec2-phpmyadmin.example.yml](ec2-phpmyadmin.example.yml) を参照してください。

### ec2-kibana playbook

ELB のアクセスログ解析を行うための fluentd + elasticsearch + kibana を立ち上げる playbook です。

[ec2-kibana.example.yml](ec2-kibana.example.yml) を参照してください。
