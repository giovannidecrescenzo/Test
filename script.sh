#!/bin/bash
#SBATCH --get-user-env
#SBATCH --time=0-03:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=5000
#SBATCH --job-name=closure_test

GROUP_ID=-1001827720736
BOT_TOKEN=6120806348:AAE2DmYWN5t8AmdGezmgZIgAXm6VgiFYBLk

vp-setupfit NNPDF40_closure_test.yml

vp-rebuild-data NNPDF40_closure_test

curl "https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$GROUP_ID&text=finito_il_rebuild_data"

n3fit NNPDF40_closure_test.yml 1
n3fit NNPDF40_closure_test.yml 2
n3fit NNPDF40_closure_test.yml 3
n3fit NNPDF40_closure_test.yml 4
n3fit NNPDF40_closure_test.yml 5

curl "https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$GROUP_ID&text=fatto_5_repliche"

evolven3fit NNPDF40_closure_test 5

curl "https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$GROUP_ID&text=evolved"

postfit 5 NNPDF40_closure_test
