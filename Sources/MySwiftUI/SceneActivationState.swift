enum SceneActivationState {
    case requested(namespace: SceneList.Namespace, item: SceneList.Item)
    case activated(namespace: SceneList.Namespace, item: SceneList.Item)
    case destroying(namespace: SceneList.Namespace, item: SceneList.Item)
}
