#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <cstdlib>

void show_help() {
    std::cout << "Usage: goto [option] [alias]\n";
    std::cout << "Options:\n";
    std::cout << "  -h, --help     Show this help message.\n";
    std::cout << "  -l, --list     List available aliases and their paths.\n";
    std::cout << "  -s  --set ALIAS    Set a new alias for a directory.\n";
    std::cout << "Examples:\n";
    std::cout << "  goto mini\n";
    std::cout << "  goto --set mini ~/Workspace/personal\n";
}

void show_aliases(const std::map<std::string, std::string>& dir_map) {
    std::cout << "Available aliases and paths:\n";
    for (const auto& pair : dir_map) {
        std::cout << "  " << pair.first << " => " << pair.second << '\n';
    }
}

void read_dir_map(std::map<std::string, std::string>& dir_map, const std::string& filePath) {
    std::ifstream inFile(filePath);
    std::string alias, path;
    while (inFile >> alias >> path) {
        dir_map[alias] = path;
    }
}

void write_dir_map(const std::map<std::string, std::string>& dir_map, const std::string& filePath) {
    std::ofstream outFile(filePath, std::ios_base::trunc);
    for (const auto& pair : dir_map) {
        outFile << pair.first << " " << pair.second << '\n';
    }
    outFile.close();
}

int main(int argc, char *argv[]) {
    const char* homeDir = std::getenv("HOME");
    if (!homeDir) {
        std::cerr << "Error: Couldn't find the home directory." << std::endl;
        return 1;
    }


    std::string dirMapFilePath = std::string(homeDir) + "/.config/zsh/custom_functions/dir_map.txt";

    std::map<std::string, std::string> dir_map;
    read_dir_map(dir_map, dirMapFilePath);

    if (argc < 2) {
        show_help();
        return 1;
    }

    std::string command = argv[1];

    if (command == "-h" || command == "--help") {
        show_help();
        return 0;
    } else if (command == "-l" || command == "--list") {
        show_aliases(dir_map);
        return 0;
    } else if (command == "--set" || command == "-s") {
        if (argc != 4) {
            std::cerr << "Error: --set requires an alias and a directory path." << std::endl;
            return 1;
        }
        std::string alias = argv[2];
        std::string path = argv[3];

        dir_map[alias] = path;
        write_dir_map(dir_map, dirMapFilePath);

        std::cout << "goto " << path << std::endl;
    } else {
        auto iter = dir_map.find(command);
        if (iter == dir_map.end()) {
            std::cerr << "Error: Invalid command." << std::endl;
            return 1;
        }
        // std::ofstream outFile(dirMapFilePath, std::ios_base::trunc);
        std::string dir = iter->second;
        std::cout << "cd " << dir << std::endl;
    }

    return 0;
}
