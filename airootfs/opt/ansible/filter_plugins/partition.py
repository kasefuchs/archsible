import re
from typing import Tuple, Any, Dict


def join_device_partition(device_tuple: Tuple[str, int]) -> str:
    device, part = device_tuple

    return f"{device}p{part}" if re.search(r"\d$", device) else f"{device}{part}"


def escape_lvm_name(name: str) -> str:
    return name.replace("-", "--")


def lvm_mapper_path(vg_lv: Tuple[str, str]) -> str:
    vg, lv = vg_lv

    escaped_vg = escape_lvm_name(vg)
    escaped_lv = escape_lvm_name(lv)

    return f"/dev/mapper/{escaped_vg}-{escaped_lv}"


# noinspection PyMethodMayBeStatic
class FilterModule:
    def filters(self) -> Dict[str, Any]:
        return {
            "join_device_partition": join_device_partition,
            "lvm_mapper_path": lvm_mapper_path,
        }
