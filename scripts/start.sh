#!/bin/bash
# 아래 위치는 여러분이 해당 리포지토리를 클론한 위치로 설정해주세요.
cd /Users/heeyoung/codestates/my-app/AWS-practice/fe-sprint-practice-deploy/server

export DATABASE_USER_PRACTICE=$(aws ssm get-parameters --region ap-northeast-2 --names DATABASE_USER_PRACTICE --query Parameters[0].Value | sed 's/"//g')
export DATABASE_PASSWORD_PRACTICE=$(aws ssm get-parameters --region ap-northeast-2 --names DATABASE_PASSWORD_PRACTICE --query Parameters[0].Value | sed 's/"//g')
export DATABASE_PORT_PRACTICE=$(aws ssm get-parameters --region ap-northeast-2 --names DATABASE_PORT_PRACTICE --query Parameters[0].Value | sed 's/"//g')
export DATABASE_HOST_PRACTICE=$(aws ssm get-parameters --region ap-northeast-2 --names DATABASE_HOST_PRACTICE --query Parameters[0].Value | sed 's/"//g')

authbind --deep pm2 start app.js