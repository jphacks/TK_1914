export default function({ route, redirect, store }) {
    // ログ出力

    // 現在のパスを取得
    const currentPath = route.path
    if (currentPath.includes('profile')) {
        return
    }
    const userId = store.state.user.userId
    if (userId == null && currentPath == '/share') redirect('/')
    else if (userId !== null && currentPath == '/') redirect('/share')
}