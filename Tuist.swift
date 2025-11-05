import ProjectDescription

let config = Config(
    plugins: [
        //.local(path: .relativeToManifest("../../Plugins/NAGAZAIOS")),
        .local(path: .relativeToRoot("Plugins/NAGAZAIOS")),
    ]
)
