import re
from typing import Tuple, Any, Dict


def join_device_partition(device_tuple: Tuple[str, int]) -> str:
    device, part = device_tuple

    return f"{device}p{part}" if re.search(r"\d$", device) else f"{device}{part}"


# noinspection PyMethodMayBeStatic
class FilterModule:
    def filters(self) -> Dict[str, Any]:
        return {"join_device_partition": join_device_partition}
