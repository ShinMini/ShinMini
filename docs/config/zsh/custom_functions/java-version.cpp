#include <iostream>
#include <string>
#include <vector>
#include <filesystem>
namespace fs = std::filesystem;

std::vector<std::string> getInstalledJavaVersions(const std::string &path) {
    std::vector<std::string> versions;
    for (const auto &entry : fs::directory_iterator(path)) {
        if (entry.is_directory()) {
            versions.push_back(entry.path().filename().string());
        }
    }
    return versions;
}

void selectJavaVersion(int choice, const std::vector<std::string> &javaVersions) {
    if (choice >= 1 && choice <= javaVersions.size()) {
        std::string selectedVersion = javaVersions[choice - 1];
        std::cout << "You selected Java version: " << selectedVersion << std::endl;
        std::cout << "Run the following command to set JAVA_HOME: " << std::endl;
        std::cout << "export JAVA_HOME=/Library/Java/JavaVirtualMachines/" << selectedVersion << "/Contents/Home" << std::endl;
    } else {
        std::cout << "Invalid choice: " << choice << std::endl;
    }
}

int main() {
    std::string javaFolderPath = "/Library/Java/JavaVirtualMachines";
    std::vector<std::string> javaVersions = getInstalledJavaVersions(javaFolderPath);
    if (javaVersions.empty()) {
        std::cout << "No Java versions found in " << javaFolderPath << std::endl;
        return 1;
    }

    int choice;
    std::cout << "Available Java versions:" << std::endl;
    for (size_t i = 0; i < javaVersions.size(); ++i) {
        std::cout << (i + 1) << ". " << javaVersions[i] << std::endl;
    }

    std::cout << "Choose the number: ";
    std::cin >> choice;
    selectJavaVersion(choice, javaVersions);
    return 0;
}
