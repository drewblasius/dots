dots:
	./setup.sh

clean:
	echo "Removing installation."
	rm -rf ~/.miniconda
	rm -f ./Miniconda*

auto-reload: dots
	su - ${USER}
