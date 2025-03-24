import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.getx_boilerplate_mvvm.dev"
            resValue(type = "string", name = "app_name", value = "Getx Boilerplate Dev")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.example.getx_boilerplate_mvvm.staging"
            resValue(type = "string", name = "app_name", value = "Getx Boilerplate Staging")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.example.getx_boilerplate_mvvm"
            resValue(type = "string", name = "app_name", value = "Getx Boilerplate")
        }
    }
}