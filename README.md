iOS-study
=======================

Requirements
------------

あらかじめ下記ツールをリンク先を参考にインストールしてください。

- VirtualBox: https://www.virtualbox.org/

    > バージョン4.3.13 以降でウィルス対策ソフトウェアと衝突する障害が報告されています。
    > もし VM 起動時に問題が発生した場合はバージョン 4.3.12 へのダウングレードを検討してください。

- Vagrant: https://www.vagrantup.com/

    > バージョン1.7.1　以降のバージョンじゃないとChefDKを使う際にエラーが出ることがあるようです。

- ChefDK:　https://downloads.chef.io/chef-dk/

- knifesolo:
```
$ gem i knife-solo --no-ri --no-rdoc
```

Get Started
-----------
```
$ vagrant up
$ vagrant reload --provision
```
