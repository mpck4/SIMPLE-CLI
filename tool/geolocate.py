""" IP Geolocation using ipinfo.io API """

import time
import itertools
import requests


def geolocate(ip: str) -> None:
    """ find, format and display geoloc """

    url = f"https://ipinfo.io/{ip}/json"

    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        print("[+] request successfully made")

    except requests.RequestException as e:
        print(f"[-] request for {ip} failed: {e}")

    data = response.json()

    # little animation

    def loading(duration: float = 2.5) -> None:
        spinner = itertools.cycle(['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'])
        end_time = time.time() + duration
        while time.time() < end_time:
            print(f"\r[*] fetching {next(spinner)}", end="", flush=True)
            time.sleep(0.08)
        print("\r" + " " * 20 + "\r", end="")

    loading()

    time.sleep(1)
    print("\n")

    # display
    print(f"Country:      {data.get('country', 'N/A')}")
    print(f"City:         {data.get('city', 'N/A')}")
    print(f"Region:       {data.get('region', 'N/A')}")
    print(f"Timezone:     {data.get('timezone', 'N/A')}")
    print(f"Coordinates:  {data.get('loc', 'N/A')}")
    print(f"Postal Code:  {data.get('postal', 'N/A')}")
    print(f"ASN:          {data.get('org', 'N/A')}")

    # google maps link
    if 'loc' in data:
        lat, lon = data['loc'].split(',')
        print(f"Google Maps:  https://www.google.com/maps/?q={lat},{lon}")


def main() -> None:
    """ where we call """
    target_ip = input("Enter the target's IP address: ")
    geolocate(target_ip)


if __name__ == "__main__":
    main()
