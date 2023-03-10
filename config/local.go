package config

type PackageInfoLocal struct {
	Name string `json:"name"`
	Path string `json:"path"`
}

func (p PackageInfoLocal) GetName() string {
	return p.Name
}

func (p PackageInfoLocal) RelativePath() string {
	return p.Path
}

// equals returns true if both the name and path.
func (p PackageInfoLocal) equals(o PackageInfoLocal) bool {
	return p.Name == o.Name && p.Path == o.Path
}
