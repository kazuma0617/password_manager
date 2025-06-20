echo "パスワードマネージャーへようこそ！"

read -p "サービス名を入力してください: " service
read -p "ユーザー名を入力してください: " username
read -p "パスワードを入力してください: " password

echo "Thank you!"

file="passwords.txt"
echo "$service:$username:$password" >> "$file"
