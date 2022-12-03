package proxmox

func NewLXC(hw Hardware, tp Template, dk Disk, nt Network, sy System) *LXC {
	return &LXC{hw: hw, tp: tp, dk: dk, nt: nt, sy: sy}
}

type LXC struct {
	hw Hardware
	tp Template
	dk Disk
	nt Network
	sy System
	cf Config
}

type Template struct {
	Name    string
	Version string
}

type Hardware struct {
	Name         string
	CPU          int
	Memory       int
	Unprivileged bool
}

type Disk struct {
	Storage string
	Size    string
}

type Network struct {
	Bridge string
	IP     string
}

type System struct {
	Name   string
	OnBoot bool
	Start  bool
}
