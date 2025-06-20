DATA_FILE="passwords.txt"

echo "パスワードマネージャーへようこそ！"

while true; do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choice

    case "$choice" in
        "Add Password")
            read -p "サービス名を入力してください：" service
            read -p "ユーザー名を入力してください：" username
            read -p "パスワードを入力してください：" password

            echo "$service:$username:$password" >> "$DATA_FILE"
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password")
            read -p "サービス名を入力してください：" service

            if [ ! -f "$DATA_FILE" ]; then
                echo "そのサービスは登録されていません。"
                continue
            fi

            result=$(grep -m 1 "^$service:" "$DATA_FILE")

            if [ -z "$result" ]; then
                echo "そのサービスは登録されていません。"
            else
                IFS=':' read -r sname uname pass <<< "$result"
                echo "サービス名：$sname"
                echo "ユーザー名：$uname"
                echo "パスワード：$pass"
            fi
            ;;
        "Exit")
            echo "Thank you!"
            break
            ;;
        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done

