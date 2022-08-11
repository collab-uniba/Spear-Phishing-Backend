package PasqualeMonniello.SpearPhishingBackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class SpearPhishingApplication {
	public static void main(String[] args) {
		SpringApplication.run(SpearPhishingApplication.class, args);
	}
}
