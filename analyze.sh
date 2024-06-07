#!/bin/bash

echo "Starting static code analysis..."

# Codesniffer
#/usr/bin/php7.4 vendor/bin/phpcs --standard=CodeSnifferRuleset.xml --report-file=CodeSnifferReport.xml app/code/ECInternet

# PHPStorm Inspections
#phpstorm inspect ~/Development/Beanstalk/mdev2v43/ ~/.config/JetBrains/PhpStorm2022.2/inspection/Default.xml ~/Development/Beanstalk/mdev2v43/Inspections -d ~/Development/Beanstalk/mdev2v43/app/code/ECInternet -format xml

# On server
echo "Running CodeSniffer analysis..."
php vendor/bin/phpcs --standard=CodeSnifferRuleset.xml --report-file=CodeSnifferReport.xml --basepath=/home/mage243dev/public_html/ app/code/ECInternet/ vendor/ecinternet/

echo "Running MessDetector analysis..."
php vendor/bin/phpmd app/code/ECInternet,vendor/ecinternet xml dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml --reportfile MessDetectorReport.xml

echo "Reports done"