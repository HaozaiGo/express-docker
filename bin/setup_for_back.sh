###
# @Description:
# @Author: xiaoHao
###
image_name=express-back
container_name=my-express-back
version=$(date +'%Y%m%d-%H%M%S')
host_port=3001      #本地端口
container_port=3000 #容器端口

echo 'docker build...' #构建镜像
docker build -t $image_name:$version .

if [ "$(docker ps -aq -f name=$contianer_name)"]; then
    echo 'docker rm...' #删除同名容器
    docker rm -f $container_name
fi
echo 'docker run...' #启动容器
docker run -d --name $container_name -p $host_port:$container_port $image_name:$version
echo 'Done'
