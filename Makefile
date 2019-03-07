dots:
	./setup.sh

clean:
	echo "Removing installation."
	rm -rf ~/.miniconda

auto-reload: dots
	su - ${USER}
